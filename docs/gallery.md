---
layout: page
title: "Photo Gallery"
permalink: /gallery/
---
{% for file in site.static_files %}
  {% if file.path contains "assets/img/gallery" %}
    {% assign alt = file.name | replace:"_", " " | replace:"-", " " | split:"." | first %}
    <a href="{{ file.path | relative_url }}" class="gallery-item">
      <img src="{{ file.path | relative_url }}" alt="{{ alt }}" loading="lazy" />
    </a>
  {% endif %}
{% endfor %}

