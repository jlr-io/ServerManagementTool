#!/home/admin/py_env/bin
import subprocess
import psycopg2
import sys
import datetime

def collect():
	# collection service	
 	try:
		#run a series of processes
		uname = subprocess.check_output(["uname", "-r"], stderr=subprocess.STDOUT)
		uname = uname.rpartition('.')
		kernel = uname[0]
		platform = uname[2].strip() #strips \n character
		#print "1. " + kernel
		#print "2. " + platform
	
		inxi_m = subprocess.check_output(["inxi","-M"], stderr=subprocess.STDOUT)
		model = inxi_m.partition('model')[2]
		model = model.split(' ')[1]
		#print "3. " + model	

		#num of cores
		lscpu = subprocess.check_output(["lscpu"], stderr=subprocess.STDOUT)
		ncore = lscpu.partition("CPU(s):")
		cpu_model = ncore[2] #going to use substring to find cpu_model later
		ncore = ncore[2].partition("\n")[0].strip()

		#cpu model
		cpu_model = cpu_model.partition("name:")
		cpu_speed = cpu_model[2] #use this substring to find the cpu_speed later
		cpu_model = cpu_model[2].partition("\n")[0].strip()
		

		#cpu speed (in MHz)
		cpu_speed = cpu_speed.partition("MHz:")
		cpu_speed = cpu_speed[2].partition("\n")[0].strip()
		
		#print "4. " + ncore
		#print "5. " + cpu_model
		#print "6. " + cpu_speed

		#disk size (in GB)
		inxi_d = subprocess.check_output(["inxi","-D"], stderr=subprocess.STDOUT)
		disk = inxi_d.partition("size:")
		disk = disk[2].strip() #strips white space
		#print "7. " + disk
		
		#mem size (in GB)
		free = subprocess.check_output(["free","-g"], stderr=subprocess.STDOUT)
		mem = free.partition("Mem:")
		mem = mem[2].lstrip().partition(" ")[0] #strips left white spaces then partitions
		#mem = mem[0]
		#print "8. " + mem		
		
		#IP
		ip = subprocess.check_output(["ip","route"], stderr=subprocess.STDOUT)
		ip = ip.rpartition("src")[2].strip()
		#print "9. " + ip

		#boot time
		boot = subprocess.check_output(["who","-b"], stderr=subprocess.STDOUT)
		boot = boot.partition("boot")
		boot = boot[2].partition("\n")[0].strip()
		#print "10. " + boot_time

		#current time
		date = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
		#print "11. " + update_time

		lsb_release = subprocess.check_output(["lsb_release","-a"], stderr=subprocess.STDOUT)
		distro = lsb_release.partition("ID:")
		distro = distro[2].partition("\n")[0].strip()
		#print distro

		release = lsb_release.partition("Release:")
		release = release[2].partition("\n")[0].strip()
		#print release

		os = distro+ " " +release
		#print "12. " + os

		system_data = {'Kernel':kernel,'Platform':platform,'Model':model,
		'Ncore':ncore,'Cpu_model':cpu_model,'Ip':ip,'Boot':boot,
		'Date':date, 'Cpu_speed':cpu_speed,'Disk':disk, 'Memory':mem,
		'Os':os}
		#returns dictonary of outputs
		return system_data
		
	except subprocess.CalledProcessError as e:
		print "Calledprocerr"

def upsert(server_id, system):
	conn = None
	try:
		conn = psycopg2.connect(database='serverinv', user='admin',	 password='pass')
		cur = conn.cursor()
		query = """INSERT INTO systems(server_id,os,kernel,platform,model
						,ncore,cpu_model,cpu_speed,disk,memory,ip,boot_time,created_at
						,updated_at)
			   VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)
			   ON CONFLICT (server_id)
			   DO UPDATE SET (os,kernel,platform,model,ncore,cpu_model,
				 cpu_speed,disk,memory,ip,boot_time,updated_at)
			   = (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s);"""
		data = (server_id,system['Os'],system['Kernel'],system['Platform'],system['Model']
		,system['Ncore'],system['Cpu_model'],system['Cpu_speed'],system['Disk']
		,system['Memory'],system['Ip'],system['Boot'],system['Date'],system['Date']
		,system['Os'],system['Kernel'],system['Platform'],system['Model']
		,system['Ncore'],system['Cpu_model'],system['Cpu_speed'],system['Disk']
		,system['Memory'],system['Ip'],system['Boot'],system['Date'])
		cur.execute(query, data)
		conn.commit()

	except psycopg2.DatabaseError, e:
		print "Error %s" % e
		sys.exit(1)

	finally:
		if conn:
			conn.close()
			

print "Collecting.."
system = collect()
server_id = 2
print "Collection complete! \nWriting to DB.."
upsert(server_id,system)
print "Write complete!"
