# Developers Only

These instructions are only relevant if you want to render a new canvas-enabled
vagrant base box.

* Make sure you have the aws-cli installed as provided by amazon, in addition to the base requirements.
* Ensure you can upload files to the relevant s3 bucket via the aws-cli s3 interface.
* Run `./bin/publish_updated_base_box.sh` to re-render and upload a new canvas box.
* After uploading a new box, you should "create a new version" on the [atlas](https://atlas.hashicorp.com) site to ensure users get the latest and greatest.
