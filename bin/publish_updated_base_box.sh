#!/bin/bash
bucket_name='dce-vagrant-images'

message() {
  printf "\e[1;34m:: \e[1;37m%s\e[0m\n" "$*"
}

failure_message() {
  printf "\n\e[1;31mFAILURE\e[0m: \e[1;37m%s\e[0m\n\n" "$*" >&2;
}

check_for_aws() {
  if ! command -v aws &>/dev/null; then
    failure_message 'You must install aws-cli to publish boxes'
    exit 1
  fi
}

upload_box_to_temp_location(){
  message "Uploading box to s3: $box"
  aws s3 cp "$box" "s3://$bucket_name/$box.tmp" --acl public-read
}

move_box_into_place(){
  message "Removing existing box: $box"
  aws s3 rm "s3://$bucket_name/$box" \
    || failure_message "Could not remove $box"

  message "Moving new box to correct location: $box"
  aws s3 mv "s3://$bucket_name/$box.tmp" "s3://$bucket_name/$box" \
    --acl public-read || failure_message 'Could not move new box into place on s3'
}

publish_box(){
  upload_box_to_temp_location && move_box_into_place
}

###################################

check_for_aws

cd canvas_base_box
# echo 'Remove already rendered base box to force re-provisioning and updating'
# vagrant destroy
rm -f *.box

if vagrant up; then
  vagrant package --base "canvas-lms_base_box" --output "ubuntu-14-04-canvas-lms.box"
fi

for box in *.box; do
  publish_box
  echo "You should now release another atlas (née 'vagrantcloud') version for harvard-dce/$box"
done
