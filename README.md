# Public Bin

Short scripts that I can securely make public.

## Structure

    * *sandbox:* scripts in testing.
    * *conf:* configuration files for scripts, user and system.
    * *lib:* short scripts called by run files.
    * *run:* long scripts that call lib scripts.

## Setup

Run `./migratescripts` to migrate scripts from the current directory to the current user's `Bin/`. It will create a `Bin/` if there isn't any.

Run `./configure` to dispense configurations to their proper locations.

Run `./upconf` to update your configurations in this repository.
