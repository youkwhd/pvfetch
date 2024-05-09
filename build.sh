#!/bin/bash

EXE=pvfetch

factor-vm -roots=$(pwd)/../ -e="\"$EXE\" deploy"
