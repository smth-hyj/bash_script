#!/bin/bash

PkgInstall(){
    pkg=$(1 .. * )
    echo "$pkg"
}

PkgInstall