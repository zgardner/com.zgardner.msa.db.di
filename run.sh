container_volume_mount_path="/var/lib/mysql"
host_volume_mount_path="$(pwd)$container_volume_mount_path"
container_name="com.zgardner.msa.db"
mysql_version="5.6.26"
mysql_root_password="mysql_root_password"
host_mysql_port="3306"
container_mysql_port="3306"

echo "Killing existing container $container_name..."
docker kill $container_name

echo "Removing existing container $container_name..."
docker rm $container_name

echo "Starting new container $container_name..."
docker run -d --name $container_name -v "$host_volume_mount_path:$container_volume_mount_path" -e MYSQL_ROOT_PASSWORD=$mysql_root_password -p $host_mysql_port:$container_mysql_port mysql:$mysql_version
