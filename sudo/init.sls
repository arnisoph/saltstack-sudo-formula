#!jinja|yaml

{% from "sudo/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('sudo:lookup')) %}

sudo:
  pkg:
    - installed
    - pkgs: {{ datamap.pkgs }}
