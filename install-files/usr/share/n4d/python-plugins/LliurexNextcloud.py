import os
import bcrypt
import tempfile
import ConfigParser
import shutil
import lliurex.net

from jinja2 import Environment
from jinja2.loaders import FileSystemLoader
from jinja2 import Template


class LliurexNextcloud:
	
	BASE_DIR="/usr/share/lliurex-nextcloud/"
	NEXTCLOUD_BASE_DIR=BASE_DIR+"llx-data/"
	NEXTCLOUD_BASE_CONFIG_DIR=NEXTCLOUD_BASE_DIR+"config-files/"
	NEXTCLOUD_BASE_CONFIG_DIR19=NEXTCLOUD_BASE_DIR+"config-files19/"

	#HTACCESS=NEXTCLOUD_BASE_CONFIG_DIR+".htaccess"
	#DIRECTORY=NEXTCLOUD_BASE_CONFIG_DIR+".directory"

	ADMIN_DATA=NEXTCLOUD_BASE_DIR+"data/"
	CONFIG_DATA=NEXTCLOUD_BASE_DIR+"config/"
	TEMPLATE_DIR=NEXTCLOUD_BASE_DIR+""
	SQL_TEMPLATE="nextcloud.sql"
	SQL_TEMPLATE_19="nextcloud19.sql"
	EASY_SITE_FILES=NEXTCLOUD_BASE_DIR+"easy-sites/"
	EASY_SITE=EASY_SITE_FILES+"nextcloud.json"
	EASY_SITE_ICON=EASY_SITE_FILES+"nextcloud.png"
	#CNAME="cname-owncloud"
	
	NEXTCLOUD_DATA_DIR="/var/www/nextcloud/data/"
	NEXTCLOUD_CONFIG_DIR="/var/www/nextcloud/config/"
	EASY_SITES_DIR="/var/www/srv/links/"
	EASY_SITES_DIR_ICON="/var/www/srv/icons/"
	
	
	
	'''
	# TESTING #
	
	TEMPLATE_DIR="/home/netadmin/"
	BASE_DIR="/home/netadmin/workspace/lliurex-owncloud/install-files"+BASE_DIR
	NEXTCLOUD_BASE_DIR=BASE_DIR+"llx-data/"
	HTACCESS=NEXTCLOUD_BASE_DIR+".htaccess"
	EASY_SITE=NEXTCLOUD_BASE_DIR+"owncloud.json"
	
	# TESTING #
	'''
	def __init__(self):
	
		self.dbg=1
		self.template=None
		self.template_vars=["DB_USER","DB_PWD","DB_NAME","ADMIN_USER","ADMIN_PWD","DEFAULT_LOCALE"]
		
	#def init

	def _debug(self,message):

		try:
			if self.dbg==1:
				print("[LliurexNextCloud]:%s"%(str(message)))
							
		except Exception as e:
			print ("[LliurexNextCloud] (_debug) %s" %(str(e)))
			
	#def__debug

	def parse_template(self,template_path):
		
		print("* Parsing template...")

		config = ConfigParser.ConfigParser()
		config.optionxform=str
		config.read(template_path)
		
		self.template={}
		try:

			self.template["DB_USER"]=config.get("nextcloud","DB_USER")
			self.template["DB_PWD"]=config.get("nextcloud","DB_PWD")
			self.template["DB_NAME"]=config.get("nextcloud","DB_NAME")
			self.template["ADMIN_USER"]=config.get("nextcloud","ADMIN_USER")
			self.template["ADMIN_PWD"]=config.get("nextcloud","ADMIN_PWD")
			self.template["DEFAULT_LOCALE"]=config.get("news","DEFAULT_LOCALE")

			self.load_template(self.template)
			return [True,""]
			
		except Exception as e:
			msg="Parsing template.Error: %s"%(str(e))
			self._debug(msg)
			return [False,""]
		
		
	#def parse_template
	
	def load_template(self,template):
		
		print("* Loading template...")
		
		try:
			if not type({})==type(template):
				return [False,""]
				
			for var in self.template_vars:
				if var not in template:
					return [False,""]
				
			self.template=template

			try:

				self.template["LDAP_BASE_USER_TREE"]="ou=People,"+objects["VariablesManager"].get_variable("LDAP_BASE_DN")
				self.template["LDAP_BASE_GROUP_TREE"]="ou=Groups,"+objects["VariablesManager"].get_variable("LDAP_BASE_DN")
				self.template["SRV_IP"]=objects["VariablesManager"].get_variable("SRV_IP")
				self.template["INTERNAL_DOMAIN"]=objects["VariablesManager"].get_variable("INTERNAL_DOMAIN")
				self.template["EXTERNAL_IP"]=lliurex.net.get_ip(objects["VariablesManager"].get_variable("EXTERNAL_INTERFACE"))
				
			except:
				import xmlrpclib as x
				
				c=x.ServerProxy("https://server:9779")
				self.template["LDAP_BASE_USER_TREE"]="ou=People,"+c.get_variable("","VariablesManager","LDAP_BASE_DN")
				self.template["LDAP_BASE_GROUP_TREE"]="ou=Groups,"+c.get_variable("","VariablesManager","LDAP_BASE_DN")
				self.template["SRV_IP"]=c.get_variable("","VariablesManager","SRV_IP")
				self.template["INTERNAL_DOMAIN"]=c.get_variable("","VariablesManager","INTERNAL_DOMAIN")
				self.template["EXTERNAL_IP"]=lliurex.net.get_ip(c.get_variable("","VariablesManager","EXTERNAL_INTERFACE"))

			self.template["ADMIN_PWD"]=self.create_password_bhash(self.template["ADMIN_PWD"])
			
		except Exception as e:
			msg="Loading Template.Error: %s"%str(e)
			self._debug(msg)
			return [False,""]	

		return [True,""]
		
	#def load_template
	
	def get_nextcloud_version(self):

		print("* Obtaining the Nextcloud version to initialize...")

		try:
			file="/var/www/nextcloud/version.php"
			if os.path.exists(file):
				with open(file, "r") as in_file:
					buf=in_file.readlines()

					for line in buf:
						if '$OC_VersionString' in line:
							if '15.0.2'	in line:
								self.nextcloud_version='15'
								break
							elif '19.0.0' in line:
								self.nextcloud_version='19'
								break
		except Exception as e:
			msg="Obtaining the Nextcloud version.Error: %s"%str(e)
			self._debug(msg)
			return [False,""]						

		return [True,""]	
	#def get_nextcloud_version	

	
	def mysql_service_init(self):
		
		print("* Initializing mysql root passwd (if needed) ...")
		try:
			os.system("sudo mysql_root_passwd -i")
		except Exception as e:
			msg="Initializing mysql service.Error %s"%(str(e))
			self._debug(msg)
			return[False,""]

		return [True,""]

	#def mysql_service_init

	def create_db(self):
		
		print("* Creating database...")
		
		if self.template==None:
			msg="Creating database.Error: template not exists"
			self._debug(msg)
			return [False,""]
			
		try:
			cmd='mysql -u%s -p%s -e "drop database IF EXISTS %s"'%(self.template["DB_USER"],self.template["DB_PWD"],self.template["DB_NAME"])
			os.system(cmd)
			
			cmd='mysql -u%s -p%s -e "create database %s"'%(self.template["DB_USER"],self.template["DB_PWD"],self.template["DB_NAME"])
			os.system(cmd)
			
			file_path=self.process_sql_template()
			if file_path==None:
				return [False,"Error processing sql template"]
			cmd="mysql -u %s -p%s %s < %s"%(self.template["DB_USER"],self.template["DB_PWD"],self.template["DB_NAME"],file_path)
			os.system(cmd)
			os.remove(file_path)
		
		except Exception as e:
			msg="Creating database.Error: %s"%(str(e))
			self._debug(msg)
			return[False,""]	
		
		return [True,""]
		
	#def init_sql
	
	def create_db_user(self):
	
		print("* Creating mysql user ...")
		
		try:
			db_pass=self.template["DB_PWD"]
			db_user=self.template["DB_USER"]
			db_name=self.template["DB_NAME"]
			cmd='mysql -uroot -p$(mysql_root_passwd -g) -e "GRANT ALL PRIVILEGES ON %s.* TO \'%s\'@localhost IDENTIFIED BY \'%s\'"'%(db_name, db_user,db_pass)
			ret=os.system(cmd)
		
		except Exception as e:
			msg="Creating mysql user.Error: %s"%(str(e))
			self._debug(msg)
			return [False,""]	
		
		return [True,ret]
		
	#def generate_user	
	
	
	def create_password_bhash(self,password):
		
		print("* Generating admin password...")
		
		salt=bcrypt.gensalt(10)
		return bcrypt.hashpw(password,bcrypt.gensalt(10))
		
	#def create_password_bhash
	
	
	def process_sql_template(self):
		
		print("* Procesing SQL template...")
		try:
			template_dir=LliurexNextcloud.TEMPLATE_DIR
			if self.nextcloud_version=='15':
				sql_template_file=LliurexNextcloud.SQL_TEMPLATE
			else:
				sql_template_file=LliurexNextcloud.SQL_TEMPLATE_19
	
			tpl_env = Environment(loader=FileSystemLoader(template_dir))
			sql_template = tpl_env.get_template(sql_template_file)
			content = sql_template.render(self.template).encode('UTF-8')

			tmp_file=tempfile.mktemp()
			f=open(tmp_file,"w")
			f.write(content)
			f.close()
			
			return tmp_file
		except:
			msg="Processing SQL template.Error: %s"%(str(e))
			self._debug(msg)
			return None
		
		
	#def process_sql_template
	
	def clean_old_files(self):
		
		print("* Cleaning old NextCloud data...")
		
		try:
			for dir in [LliurexNextcloud.NEXTCLOUD_DATA_DIR,LliurexNextcloud.NEXTCLOUD_CONFIG_DIR]:
				if os.path.exists(dir):
					os.system("rm -rf %s"%dir)
		except Exception as e:
			msg="Cleaning old NextCloud data.Error: %s"%(str(e))
			self._debug(msg)
			return[False,""]			
			
		return [True,""]
		
	#def clean_old_files
	
	def copy_new_files(self):
		
		print("* Copying new NextCloud data...")
		
		try:
			if self.nextcloud_version=='15':
				cmd="cp -r %s/* %s"%(LliurexNextcloud.NEXTCLOUD_BASE_CONFIG_DIR,"/var/www/nextcloud/")
			else:
				cmd="cp -r %s/* %s"%(LliurexNextcloud.NEXTCLOUD_BASE_CONFIG_DIR19,"/var/www/nextcloud/")

			os.system(cmd)
			
		
			for dir in [LliurexNextcloud.NEXTCLOUD_DATA_DIR,LliurexNextcloud.NEXTCLOUD_CONFIG_DIR]:
				if os.path.exists(dir):
					os.system("chown -R www-data:www-data %s"%dir)
					
			os.system("chmod 775 %s"%LliurexNextcloud.NEXTCLOUD_CONFIG_DIR)
			os.system("chmod 770 %s"%LliurexNextcloud.NEXTCLOUD_DATA_DIR)
			
			os.system("mv %s/ADMIN_USER %s/%s"%(LliurexNextcloud.NEXTCLOUD_DATA_DIR,LliurexNextcloud.NEXTCLOUD_DATA_DIR,self.template["ADMIN_USER"]))
			
			'''
			cmd="cp %s %s"%(LliurexNextcloud.HTACCESS,"/var/www/nextcloud/")
			os.system(cmd)
			cmd="cp %s %s"%(LliurexNextcloud.DIRECTORY,"/var/www/nextcloud/")
			os.system(cmd)
		'''		
		except Exception as e:
			msg="Copying new NextCloud data.Error: %s"%(str(e))
			self._debug(msg)
			return[False,""]
			
		return [True,""]
		
	#def copy_new_files
	
	def process_config_file(self):
		
		print("* Procesing config template...")
		
		try:
			template_dir=LliurexNextcloud.NEXTCLOUD_CONFIG_DIR
			template_file="config.php"
			
			tpl_env = Environment(loader=FileSystemLoader(template_dir))
			template = tpl_env.get_template(template_file)
			content = template.render(self.template).encode('UTF-8')
			
			f=open(template_dir+template_file,"w")
			f.write(content)
			f.close()		
		
		except Exception as e:
			msg="Processing config template.Error: %s"%(str(e))
			self._debug(msg)
			return[False,""]	

		return [True,""]
		
	#def process_config_file
	
	def enable_easy_site(self):
		
		print("* Enabling easy site...")
		
		try:
			if os.path.exists(LliurexNextcloud.EASY_SITES_DIR):
				shutil.copy(LliurexNextcloud.EASY_SITE,LliurexNextcloud.EASY_SITES_DIR)
				
			if os.path.exists(LliurexNextcloud.EASY_SITES_DIR_ICON):
				shutil.copy(LliurexNextcloud.EASY_SITE_ICON,LliurexNextcloud.EASY_SITES_DIR_ICON)	
		
		except Exception as e:
			msg="Enabling easy-site.Error: %s"%(str(e))
			self._debug(msg)
			return [False,""]

		return [True,""]
		
	#def enable_easy_site
	
	def enable_cname(self):

		'''
		template_dir=LliurexNextcloud.NEXTCLOUD_BASE_DIR
		tpl_env = Environment(loader=FileSystemLoader(template_dir))
		template = tpl_env.get_template(LliurexNextcloud.CNAME)
		
		content = template.render(self.template).encode('UTF-8')
		f=open("/var/lib/dnsmasq/config/cname-owncloud","w")
		f.write(content)
		f.close()
		
		'''

		f=open("/etc/n4d/key","r")
		magic_key=f.readline().strip("\n")
		f.close()
		import xmlrpclib as x
		c=x.ServerProxy("https://server:9779")
		result = c.set_internal_dns_entry(magic_key,"Dnsmasq","nextcloud")
		if result['status'] == True:
			os.system("service dnsmasq restart")
			return [True,""]
		else:
			return [False,result['msg']]
		
		
	#def enable_cname
	
	def enable_apache_conf(self):
		
		os.system("a2enmod ldap")
		os.system("a2enmod ssl")
		os.system("a2enmod rewrite")
		os.system("a2enmod headers")
		os.system("a2ensite default-ssl.conf")
		os.system("service apache2 restart")
		os.system("a2ensite nextcloud.conf")
		os.system("a2enconf nextcloud")
		os.system("service apache2 reload")
		
	#def enable_apache_mods
	
	
	def initialize_nextcloud(self,template):
		
		try:

			status,ret=self.load_template(template)
			if not status:
				return [False,"1"]

			status,ret=self.get_nextcloud_version()
			if not status:
				return [False,"2"]

			status,ret=self.mysql_service_init()
			if not status:
				return [False,"3"]

			status,ret=self.create_db_user()
			if not status:
				return [False,"4"]

			status,ret=self.create_db()
			if not status:
				return [False,"5"]

			status,ret=self.clean_old_files()
			if not status:
				return [False,"6"]

			status,ret=self.copy_new_files()
			if not status:
				return [False,"7"]

			status,ret=self.process_config_file()
			if not status:
				return [False,"8"]

			status,ret=self.enable_easy_site()
			if not status:
				return [False,"9"]
			
			status,ret=self.enable_cname()
			if not status:
				return [False,"10"]
				
			self.enable_apache_conf()
				
			return [True,"SUCCESS"]
			
		except Exception as e:
			msg="Error in NextCloud setup process: %s"%(str(e))
			self._debug(msg)
			return [False,"?"]
		
	#def initlializ_owncloud
	
	
#class LliurexNextcloud

if __name__=="__main__":
	
	lo=LliurexNextcloud()
	lo.parse_template("/home/netadmin/nextcloud.ini")
	lo.get_nextcloud_version()
	lo.mysql_service_init()
	lo.create_db_user()
	lo.create_db()
	lo.clean_old_files()
	lo.copy_new_files()
	lo.process_config_file()
	lo.enable_easy_site()
	lo.enable_apache_conf()


	
	