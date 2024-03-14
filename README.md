# smp_tool/cli

A Ruby command-line application to work with the Elektronika MK90 volume images.

## Key features

* **Supports all common operations**:
  * creating new volumes;
  * adding BASIC files to a volume;
  * deleting BASIC files from a volume;
  * renaming BASIC files on a volume;
  * extracting BASIC files from a volume;
  * changing volume size.

* **Supports variable volume size: from 4 up to 127 clusters (2048 – 65024 bytes)**

  A standard MPO-10 cartridge has capacity of 20 clusters (10240 bytes), but the tool can create volumes of smaller or larger size. Such volumes can be loaded into a real machine with a modern cartridge such as [azya52/STMP](https://github.com/azya52/STMP) (not tested) or [azya52/PIMP](https://github.com/azya52/PIMP) (seems to work only on BASIC v.1.0 systems, see below). The emulator by Piotr Piatek also supports such volumes.

* **Supports Elektronika MK90 BASIC v.1.0 and v.2.0 volumes**

  The tool automatically detects the volume version while loading the volume. Manual specification of the target BASIC version requires only to create an empty volume.

* **Allows to create volumes with the auto-loader**

  Create a volume with the `--bootloader="auto"` option. Then add the `AUTO.BAS` file to the volume files. Mount the volume to the MK90, and select the slot in the main menu. This will automagically load and run any BASIC script defined in the `AUTO.BAS` file. Auto loaders were developed by Piotr Piatek.

* **Has a special mode that can free one more cluster (512 bytes) to store data**

  Create a volume with the `--n-cls-per-dir-seg=1` option. This will create a volume with a "trimmed" directory segment, allowing to use one more cluster to store data.

## Known bugs and limitations

* PIMP cartridge seems to be incompatible with the BASIC v.2.0 system. While the cartridge can run binary code on both version of the system, the access to the volume from the BASIC environment seems to work only on the v.1.0 systems. This is not a bug in the **smp_tool** software but rather a limitation caused by the PIMP design.

## Prerequisites

* Ruby ver. >= 3.0.0.

## Installation

    $ gem install smp_tool-cli

## Usage

General syntax is:

    $ smp_tool <command> [options]
    
Use the `-h` flag to get the list of available commands:

    $ smp_tool -h

Call a command with the `-h` flag to get help information about the command:

    $ smp_tool <command> -h

## Tips

* To load a program in BASIC 1.0 simply provide a filename in quotes, e.g.: `LOAD "FILE.BAS"`. To load a program in BASIC 2.0 add the parameter `A`, e.g.: `LOAD "FILE.BAS", A`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/8bit-mate/smp_tool-cli.rb.

## Special thanks to

- **[Piotr Piatek](http://www.pisi.com.pl/piotr433/index.htm)**: the indisputable master of the MK90 who developed lots of great software tools and hardware devices for the machine;

- **[azya52](https://github.com/azya52/)**: the developer of the PIMP cartridge. This device made possible to load large volumes on a real MK90;

- **[flint-1979](https://phantom.sannata.org/memberlist.php?mode=viewprofile&u=6909)**: testing on the real machines with both BASIC v.1.0 and v.2.0;

- **[BitSavers project](http://www.bitsavers.org/)**: the largest source of the DEC PDP-11 / RT-11 and other legacy systems documentation.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
