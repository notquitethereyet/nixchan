# This configuration file is now just a compatibility layer.
# The actual configuration has been moved to the hosts directory.
# This file is kept for backward compatibility with tools that expect it.

{ config, pkgs, inputs, ... }:

{
  # Import the host configuration for nixchan
  imports = [ ./hosts/nixchan ];
}
