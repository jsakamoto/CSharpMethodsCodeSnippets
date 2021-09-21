@echo off
pushd %~dp0
pwsh -NoProf -Exec unrestricted -C ".\build-vsix.ps1"
