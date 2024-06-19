#!/bin/bash

PkgInstall(){
    pkg=$@
    for i in length "$pkg"
    echo "$pkg"
}

PkgInstall