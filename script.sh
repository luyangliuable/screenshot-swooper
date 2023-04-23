# This function retrieves the latest screenshot file on the desktop (if no argument is given), or in the current directory (if an argument is given).
# The function then renames the screenshot file to a randomly generated 4-character string and moves it to the current directory.

function get_file {

    # Check if an argument was passed in. If not, get the latest screenshot file on the desktop.
    if [ -z $1 ]; then
        file=$(ls -t ~/Desktop | head -1)
    else
        # If an argument is given, get the latest screenshot file in the current directory.
        file=$(ls -t $0 | head -1)
    fi

    # Print the name of the latest screenshot file to the console.
    echo "The latest screenshot file is $file"

    # Construct the full file path of the screenshot file on the desktop.
    full_file_path=~/Desktop/$file

    # Get the current directory.
    current_dir="$(pwd)"

    # Generate a new file name using 4 characters of a randomly generated 48-character string.
    new_file_name=$(openssl rand -base64 48 | cut -c1-4)

    # Move the screenshot file to the current directory, using the new file name and the ".png" extension.
    mv "$full_file_path" "$current_dir/$new_file_name.png"
}

# Call the get_file function.
get_file
