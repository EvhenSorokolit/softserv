# To add crontab
 echo "==============backup Script=====================" >> /etc/crontab
 echo "*/1 *  * * *   root  path_to_script/script_c.sh  path_to_target_dir  path_to_bachupdir" >> /etc/crontab
 
# Log file must be at /var/log/script.log
