
def getOxygenReading(readings):
    remainingReadings = readings
    prefix = ""

    for i in range(len(readings[0])):
        ones = []
        zeroes = []
        for reading in remainingReadings:
            if reading.startswith(prefix + "1"):
                ones.append(reading)
            else:
                zeroes.append(reading)
        if len(ones) >= len(zeroes):
            prefix += "1"
            remainingReadings = ones
        else:
            prefix += "0"
            remainingReadings = zeroes

        if len(remainingReadings) == 1:
            break
    print(int(remainingReadings[0], 2))
    return int(remainingReadings[0], 2)

def getScrubberReading(readings):
    remainingReadings = readings
    prefix = ""

    for i in range(len(readings[0])):
        ones = []
        zeroes = []
        for reading in remainingReadings:
            if reading.startswith(prefix + "1"):
                ones.append(reading)
            else:
                zeroes.append(reading)
        if len(ones) < len(zeroes):
            prefix += "1"
            remainingReadings = ones
        else:
            prefix += "0"
            remainingReadings = zeroes

        if len(remainingReadings) == 1:
            break
    print(int(remainingReadings[0], 2))
    return int(remainingReadings[0], 2)


if __name__ == "__main__":

    readings = []

    with open("day 3 input.txt", "r") as f:
        readings = f.readlines()

    print(getOxygenReading(readings) * getScrubberReading(readings))