bash
#!/bin/bash
# Catspins PC Kit for Linux Debian

echo "Catspins PC Kit - Linux Debian Optimizer"
echo "1. Clean temporary files"
echo "2. Clear cache"
echo "3. Remove unused packages"
echo "4. Defragment hard drive"
echo "5. Exit"

while true do
    read -p "Enter your choice (1-5): " choice

    case $choice in        1)
 clean           _temp_files
                   2
)
            clear_cache
                   3)
            remove_unused_packages
                   4)
            defragment_hard_drive
                   5)
            exit
                   *)
            echo "Invalid choice! Please enter a number between 1 and 5."
               esac
done

clean_temp_files() {
    echo "Cleaning temporary files..."
    echo "**********************************"
    rm -rf /tmp/*
    echo "Temporary files cleaned successfully."
    echo
    read -p "Press Enter to continue..."
}

clear_cache() {
    echo "Clearing cache..."
    echo "**********************************"
    apt-get clean
    echo "Cache cleared successfully."
    echo
    read -p "Press Enter to continue..."
}

remove_unused_packages() {
    echo "Removing unused packages..."
    echo "**********************************"
    apt-get autoremove --purge
    echo "Unused packages removed successfully."
    echo
    read -p "Press Enter to continue..."
}

defragment_hard_drive() {
    echo "Defragmenting hard drive..."
    echo "**********************************"
    e4defrag /
    echo "Hard drive defragmented successfully."
    echo
    read -p "Press Enter to continue..."
}
