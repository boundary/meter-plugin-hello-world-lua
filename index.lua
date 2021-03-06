-- Copyright 2015 Boundary, Inc.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--    http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-- Add require statements for built-in libaries we wish to use
local math = require('math')
local os = require('os')
local string = require('string')
local timer = require('timer')

-- Source of our metric
local SOURCE = 'HelloWorld'

-- How often to output a measurement
local POLL_INTERVAL = 5

-- Define our function that "samples" our measurement value
function poll()

  -- Generate random number between 0 and 99
  local value = math.random(0, 99)

  -- Get the current time
  local timestamp = os.time()

  -- Output our measurement record to standard out
  print(string.format("%s %s %s %s", "BOUNDARY_HELLO_WORLD", value, SOURCE, timestamp))

end

-- Set the timer interval and call back function poll(). Multiple input configuration
-- pollIterval by 1000 since setIterval expects milliseconds
timer.setInterval(POLL_INTERVAL * 1000, poll)

