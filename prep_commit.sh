container_name="com.zgardner.msa.db"
mysql_volume_path="var/lib/mysql"
target_user="zgardner"

echo "Killing Docker container $container_name..."
sudo docker kill $container_name

echo "Changing ownership for $mysql_volume_path..."
sudo chown -R $target_user $mysql_volume_path

echo "Adding files..."
git add ./
