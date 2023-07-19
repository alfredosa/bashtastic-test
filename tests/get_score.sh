#!/bin/bash
tput setaf 3
printf "Running score program\n\n"
current_directory=$(pwd)
total_points=0

if [ ! -f "$current_directory/1_cat_backup.sh" ]; then
    echo "No points for 1_cat_backup.sh"
    tput setaf 3
else
    output=$($current_directory/1_cat_backup.sh)
    if [ -d "$current_directory/backups" ]; then
        if [ -f "$current_directory/backups/backup_1_cat_backup.sh" ]; then
            echo "backup_1_cat_backup.sh (extra point): 2 points"
            total_points=$((total_points+2))
        elif [ -f "$current_directory/backups/backup.sh" ]; then
            tput setaf 2
            echo "backup.sh: 1 point"
            tput setaf 3
            total_points=$((total_points+1))
        else
            echo "No points for backup.sh"
            tput setaf 3
        fi
    else
        tput setaf 1
        echo "1_cat_backup.sh: 0 points"
        tput setaf 3
    fi
fi

echo; echo

if [ ! -d listings ]; then
    tput setaf 1
    echo "No points for 2_homedir_listing.sh"
    tput setaf 3
else
    if [ -f listings/homedir.txt.gz ] && [ -f listings/homedir.txt ]; then
        tput setaf 2
        echo "homedir.txt.gz: 1 point"
        tput setaf 3
        total_points=$((total_points+1))
    else
        tput setaf 1
        echo "No points for homedir.txt.gz"
        tput setaf 3
    fi
fi

echo; echo

if [ ! -f "$current_directory/3_for_to_while_loop.sh" ]; then
    tput setaf 1
    echo "No points for 3_for_to_while_loop.sh"
    tput setaf 3
else
    output=$($current_directory/3_for_to_while_loop.sh)
    test_output=$(cat $current_directory/tests/3_while_output.txt)
    if [ "$output" = "$test_output" ]; then
        tput setaf 2
        echo "3_for_to_while_loop.sh: 1 point"
        tput setaf 3
        total_points=$((total_points+1))
    else
        echo "$output"
        tput setaf 1
        echo "Expected:"
        echo "$test_output"
        echo "No points for 3_for_to_while_loop.sh"
        tput setaf 3
    fi
fi

echo; echo

if [ ! -f "$current_directory/4_txt_file_spacing.sh" ]; then
    tput setaf 1
    echo "No points for 4_txt_file_spacing.sh"
    tput setaf 3
else
    output=$($current_directory/4_txt_file_spacing.sh)
    test_output=$(cat $current_directory/tests/4_txt_spacing.txt)
    if [ "$output" = "$test_output" ]; then
        tput setaf 2
        echo "4_txt_file_spacing.sh: 1 point"
        tput setaf 3
        total_points=$((total_points+1))
    else
        echo "$output"
        tput setaf 1
        echo "Expected:"
        echo "$test_output"
        echo "No points for 4_txt_file_spacing.sh"
        tput setaf 3
    fi
fi

echo; echo

if [ ! -f "$current_directory/5_echo_itself_backwards.sh" ]; then
  tput setaf 1
  echo "No points for 5_echo_itself_backwards.sh"
  tput setaf 3
else
  output=$($current_directory/5_echo_itself_backwards.sh)
  
  # Reverse the lines of the file manually
  expected_output=""
  while IFS= read -r line; do
    expected_output="$line"$'\n'"$expected_output"
  done < "$current_directory/5_echo_itself_backwards.sh"
  expected_output=$(echo "$expected_output" | rev)

  output_clean=$(echo "$output" | grep -x .)
  expected_output_clean=$(echo "$expected_output" | grep -x .)

  if [ "$output_clean" = "$expected_output_clean" ]; then
    tput setaf 2
    echo "5_echo_itself_backwards.sh: 1 point"
    tput setaf 3
    total_points=$((total_points+1))
  else
    echo "$output"
    tput setaf 1
    echo "Expected:"
    echo "$expected_output"
    echo "No points for 5_echo_itself_backwards.sh"
    tput setaf 3
  fi
fi

echo; echo
score=$(printf "%.2f" "$(echo "scale=2; 100 * $total_points / 5" | bc -l)")

# Read the score messages from the JSON file
json_file="tests/score_messages.json"
score_messages=$(jq -r 'to_entries[] | "\(.key)=\(.value)"' "$json_file")

tmp_file=$(mktemp)

printf "%s\n" "$score_messages" > "$tmp_file"

while IFS="=" read -r threshold message; do
    if [ "$(echo "$score >= $threshold" | bc -l)" -eq 1 ]; then
        tput setaf 2
        echo "$message"
        tput sgr0
        break
    fi
done < "$tmp_file"

rm "$tmp_file"


