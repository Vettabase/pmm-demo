# Percona Monitoring and Management Demo

A re-usable demo of Percona's Monitoring and Management suite in docker. Test data is generated using sysbench.

The current focus is to demonstrate monitoring and alerting in PMM for MariaDB.

## Requirements

* docker
* sysbench


## Usage

Start the containers with docker:

    docker compose up -d

You can check the containers using `docker ps`.

Once the containers are running, you can access the PMM user interface by naviating to:

    https://localhost

The default username is `admin` and the password is also `admin`. You will be prompted to to change this after logging in for the first time. This can be skipped if you wish.

From within the PMM interface, add the database servers to the inventory for monitoring.

The `run.sh` script will generate load against the primary database.
This script takes one argument, the path to the sysbench tests directory.
If you have installed sysbench on MacOS from homebrew, that directory will be something like `/opt/homebrew/Cellar/sysbench/1.0.20_6/share/sysbench`.
