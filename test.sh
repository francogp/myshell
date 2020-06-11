#!/usr/bin/env bash

if hostnamectl | grep -q "18.04"; then
  echo "Old ubuntu detected, applying fixes"
fi
