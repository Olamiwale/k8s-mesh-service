set -e

echo "Checking required tools..."

tools=(git docker kubectl terraform az gh helm)
missing=0

for tool in "${tools[@]}"; do
    if command -v "$tool" >/dev/null 2>&1; then
        echo "$tool Installed"
    else
        echo " $tool Not Installed"
    fi

done


 if [ "$missing" -gt 0 ]; then
     echo ""
     echo "Install the missing tools before continuing."
     exit 1
   
 fi



echo "check complete ..."