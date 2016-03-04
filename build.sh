#!/bin/sh

bundle exec jekyll build --source themes/default --destination files/_g_20160304_xxx
tar -zcvf files/_g_20160304_xxx.tar.gz files/_g_20160304_xxx
