import csv

def shift_and_move(array):
    n = 10  # Size of each chunk
    for i in range(0, len(array), n):
        # Store the 2nd element
        temp = array[i + 1]
        # Shift elements from 3rd to 10th one position back
        for j in range(i + 1, i + 9):
            array[j] = array[j + 1]
        # Place the stored 2nd element in the 10th position
        array[i + 9] = temp
    return array


run = 'run4_100.csv'

# Read the content of the first CSV file
with open(run, 'r') as file1:
    reader = csv.reader(file1)
    numbers_file1 = [str(row[1]) for row in reader if len(row) > 1]
numbers_file1 = [x for x in numbers_file1 if x]
numbers_file1 = shift_and_move(numbers_file1)

# Read the content of the second CSV file
with open('optimal.csv', 'r') as file2:
    reader = csv.reader(file2)
    numbers_file2 = [int(row[0]) for row in reader]

new_arr1 = []
new_arr2 = []
for val1, val2 in zip(numbers_file1, numbers_file2):
    # Check if val1 is 'N/A'
    if val1.strip() != 'N/A':
        # If not 'N/A', append both values to new_arr1 and new_arr2
        new_arr1.append(int(val1))
        new_arr2.append(int(val2))

# Calculate deviations and average deviation
total_deviation_percentage = 0
for num1, num2 in zip(new_arr1, new_arr2):
    deviation = abs(num1 - num2)
    if deviation == 0:
        continue
    deviation_percentage = (deviation / num1) * 100  # Calculate deviation as a percentage
    total_deviation_percentage += deviation_percentage

average_deviation_percentage = total_deviation_percentage / len(new_arr1)

print("Average deviation percentage:", average_deviation_percentage)



# Open the CSV file and read the data
with open(run, 'r') as file:
    reader = csv.reader(file)
    data = list(reader)

data = [sublist for sublist in data if any(sublist)]

# Extract times and convert to integers
times = []
for row in data:
    if len(row) > 2 and "N/A" not in row[2]:
        time_str = row[2].replace("ms", "")
        if time_str.endswith("s"):
            time_str = time_str[:-1]  # Remove the 's' suffix
            time_ms = int(float(time_str) * 1000)  # Convert seconds to milliseconds
            times.append(time_ms)
        else:
            times.append(int(time_str))

# Calculate the average time
average_time = sum(times) / len(times)

print("Average time:", average_time, "ms")


# Open the CSV file and read the data
with open(run, 'r') as file:
    reader = csv.reader(file)
    data = list(reader)

# Initialize counters
optimal_count = 0
satisfiable_count = 0
infeasible_count = 0

# Iterate through the data and count occurrences
for row in data:
    if row:  # Check if the row is not empty
        if row[0] == 'optimal':
            optimal_count += 1
        elif row[0] == 'satisfiable':
            satisfiable_count += 1
        elif row[0] == 'infeasible':
            infeasible_count += 1

print("Optimal count:", optimal_count)
print("Satisfiable count:", satisfiable_count)
print("Infeasible count:", infeasible_count)
