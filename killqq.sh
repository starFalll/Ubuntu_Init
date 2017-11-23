#!/bin/bash
ps -A | grep QQ | awk '{print $1}'|xargs kill > /dev/null 2>&1
