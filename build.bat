@echo off
pushd %~dp0
powershell -NoProf -Exec unrestricted -C ".\build-vsix.ps1"
