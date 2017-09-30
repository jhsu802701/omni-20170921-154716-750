#!/bin/bash

sh config_env.sh

sh pg-start.sh

sh kill_spring.sh
sh all.sh
