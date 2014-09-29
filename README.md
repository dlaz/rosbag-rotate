rosbag-rotate
=============

Scripts to use logrotate with rosbag and push data to a remote server

# Configuration
1. (optional) Create a new account on the remote machine, and restrict it as desired
2. On the robot machine, create a new keypair with on passphrase 

  ```
  ssh-keygen -f ~/.ssh/id_log_copy -C "Automated remote backup"
  ```

3. Configure the local machine to use this new key when accessing the remote machine. Open up `~/.ssh/config` and add

  ```
  Host [REMOTE_MACHINE]
    IdentityFile ~/.ssh/id_log_copy
    # if you created a new user, add the next line too
    User [USER]
  ```

3. Copy the public key to the remote server

  ```
  ssh-copy-id -i ~/.ssh/id_copy_log.pub [USER@]REMOTE_MACHINE
  ```
  
4. (If you created a new user for backups and want to handle security restrictions through the user, skip to step ...) On the remote machine, copy rrsync to somewhere on your path. This is the path to rrsync on ubuntu - other systems may have it elsewhere.

  ```
  gunzip /usr/share/doc/rsync/scripts/rrsync.gz -c > ~/bin/rrsync
  ```
  
5. Restrict the newly created key pair to only rsync by prepending the following to the line for your new key in the remote machine's `~/.ssh/authorized_keys`

  ```
  command="$HOME/bin/rrsync ~[LOG_DIR]",no-agent-forwarding,no-port-forwarding,no-pty,no-user-rc,no-X11-forwarding
  ```
  Note: this, and the key should both be on a single line.
  
