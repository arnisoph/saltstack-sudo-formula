{% from "sudo/defaults.yaml" import rawmap with context %}
{% set datamap = salt['grains.filter_by'](rawmap, merge=salt['pillar.get']('sudo:lookup')) %}

sudo:
  pkg:
    - installed
    - pkgs:
{% for p in datamap.pkgs %}
      - {{ p }}
{% endfor %}
