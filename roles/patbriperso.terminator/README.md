Terminator
==========

Install and configure Terminator.

Requirements
------------

None.

Role Variables
--------------

terminator_config

Set this variable to define settings of Terminator.

Example:

```yaml
terminator_config:
  global_config:
    disable_mouse_paste: false
  keybindings:
    full_screen: "<Ctrl><Shift>F11"
  profiles:
    default:
      background_type: "solid"
```

Will set the configuration file ~/.config/terminator/config file with :

```
[global_config]
  disable_mouse_paste = False

[keybindings]
  full_screen = <Ctrl><Shift>F11

[profiles]
  [[default]]
    background_type = solid
```

Dependencies
------------

None.

Example Playbook
----------------

```yaml
    - hosts: servers
      roles:
         - role: patbriperso.terminator
```

License
-------

MIT
