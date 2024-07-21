struct VOutput {
    location(0) v_color: vec4<f32>; // выходные данные цвета вершины
    builtin(position) position: vec4<f32>; // встроенная позиция
};

[[stage(vertex)]]
fn vs_main([[builtin(vertex_index)]] in_vertex_index: u32) -> VOutput { // основной шейдер
    var pos = array<vec2<f32>,3> ( // позиция трех вершин
        vec2<f32>(0.0, 0.5),
        vec2<f32>(-0.5, -0.5),
        vec2<f32>(0.5, 0.5),
    );

    var color = array<vec2<f32>,3> (
        vec3<f32>(1.0, 0.0, 0.0),
        vec3<f32>(0.0, 0.1, 0.0),
        vec3<f32>(0.0, 0.0, 0.1),
    );

    var out: VOutput;
    out.position = vec4<f32>(pos[in_vertex_index], 0.0, 1.0);
    out.v_color = vec4<f32>(color[in_vertex_index], 1.0);
    return out
}

[[stage(fragment)]]
fn fs_main(in: VOutput) -> [[location(0)]] vec4<f32> { // фрагментный шейдер
    return in.v_color
}
