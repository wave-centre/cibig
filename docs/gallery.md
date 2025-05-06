---
layout: page
title: "Photo Gallery"
permalink: /gallery/
---

> _A glimpse of CIBiG moments training sessions, lab work, and community life._

<div class="gallery" markdown="0">
{% for file in site.static_files %}
  {% if file.path contains "assets/img/gallery" %}
    {% assign alt = file.name | replace:'_',' ' | replace:'-',' ' | split:'.' | first %}
    <a href="{{ file.path | relative_url }}" class="gallery-item">
      <img src="{{ file.path | relative_url }}" alt="{{ alt }}" loading="lazy">
    </a>
  {% endif %}
{% endfor %}
</div>

<style>
.gallery{
  display:grid;
  grid-template-columns:repeat(auto-fill,minmax(220px,1fr));
  gap:1rem;
}
.gallery-item img{
  width:100%;
  height:auto;
  border-radius:6px;
  box-shadow:0 2px 6px rgba(0,0,0,.15);
  transition:transform .25s ease;
}
.gallery-item img:hover{
  transform:scale(1.04);
}
</style>
