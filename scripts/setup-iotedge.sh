# Copyright (c) Microsoft. All rights reserved.
# Licensed under the MIT license. See LICENSE file in the project root for full license information.

script_dir=$(cd "$(dirname "$0")" && pwd)

# install moby-engine
curl -L https://aka.ms/moby-engine-armhf-latest -o moby_engine.deb && sudo dpkg -i ./moby_engine.deb
[ $? -eq 0 ] || { echo "install moby-engine failed"; exit 1; }

rm ./moby_engine.deb

# install moby-cli
curl -L https://aka.ms/moby-cli-armhf-latest -o moby_cli.deb && sudo dpkg -i ./moby_cli.deb
[ $? -eq 0 ] || { echo "install moby-cli failed"; exit 1; }

rm ./moby_cli.deb

# Run apt-get fix
sudo apt-get install -f
[ $? -eq 0 ] || { echo "run apt-get fix failed"; exit 1; }

# install the standard libiothsm implementation
curl -L https://aka.ms/libiothsm-std-linux-armhf-latest -o libiothsm-std.deb && sudo dpkg -i ./libiothsm-std.deb
[ $? -eq 0 ] || { echo "install libiothsm failed"; exit 1; }

rm ./libiothsm-std.deb

# install the IoT Edge Security Daemon
curl -L https://aka.ms/iotedged-linux-armhf-latest -o iotedge.deb && sudo dpkg -i ./iotedge.deb
[ $? -eq 0 ] || { echo "install IoT Edge Security Daemon failed"; exit 1; }

rm ./iotedge.deb

# Run apt-get fix
sudo apt-get install -f
[ $? -eq 0 ] || { echo "run apt-get fix failed"; exit 1; }

sudo chmod 666 /etc/iotedge/config.yaml
[ $? -eq 0 ] || { echo "sudo chmod"; exit 1; }

