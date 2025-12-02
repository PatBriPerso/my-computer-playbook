Role Name
=========

Install flatpak and allow to install or remove apps.

Requirements
------------

None.

Role Variables
--------------

apps_to_install

A list of application ID to install.

apps_to_remove

A list of application ID to remove.

Dependencies
------------

None.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

License
-------

MIT
