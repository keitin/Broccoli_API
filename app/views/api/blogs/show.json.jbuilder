  json.materials @blog.materials do |material|
    json.material_type material.materialable_type
    json.material material.materialable
  end