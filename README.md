#Overview

Installs dbf files into an 11.2.0.4 Oracle vagrant box, and configures the listener and db to autostart.

##Usage

Edit the default.rb attributes file and set the SID for the database.  This will be used throughout for folder names, etc.

Create cookbooks/oracle/files/default/<SID_NAME> directory, and place the dbf files compressed in .gz format within.  (The recipes will gunzip all *.gz files).  You must also provide a createdb.sql file that will recreate the control files and temp file.  

Note that the db files will be placed in /u02/oradata/<SID_NAME>.

Example:  if your db was called MYDB, then you would edit default.rb to contain

```
default["sid"] = "MYDB"
```

and create cookbooks/oracle/files/default/MYDB, containing your dbf files (gzipped) and a createdb.sql script.

Your vagrant must have the CentOS-6.5-oracledb-11.2.0.4 box installed.  If you don't have the box, installed, you can build it - see https://github.com/sriddell/vagrant-oracle-11gR2.

Run 

```
vagrant up
```

Once the box is up, login (vagrant ssh) and make sure the database was created successfully.

To package the newly created box for distribution, shutdown the db cleanly.  su to root (password is vagrant) and run the zerofree.sh script in root's home directory to zero out free space.  If you do not do this, the packaged box will be much large than necessary.

After zerofree finishes running, exit and package the box with 

```
vagrant package
```

##Accounts

* vagrant passwd:vagrant
* oracle passwd:oracle
* root passwd:vagrant
