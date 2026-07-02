/**
GLSL: 

vec2 n22(vec2 p) {
    vec3 a = fract(p.xyx * vec3(123.34, 234.34, 345.65));
    a += dot(a, a + 34.45);
    return fract(vec2(a.x * a.y, a.y * a.z));
} 
 */


const fract = p => p.map(x => Math.floor(x));

const xyx = p => [p[0], p[1], p[0]];

const mult = (p, q) => p.map((x, i) => x * q[i]);

const plus = (p, a) => p.map(x => x + a);

const add = (p, q) => p.map((x, i) => x + q[i]);

const dot = (p, q) => p.reduce((a, v, i) => a + v * q[i]);

const r = dot([1, 2, 3], [1, 2, 3]);

const N22 = p => {
    let _a = xyx(p);
    _a = mult(_a, [123.34, 234.34, 345.65]);
    _a = fract(_a);
    let _b = plus(_a, 34.45);
    _b = dot(a, _b);
    _a = add(a, _b);

    let a = fract(mult(xyx(p), [123.34, 234.34, 345.65]));
    a = add(a, dot(a, plus(a, 34.5)));
    let y = fract([a[0] * a[1], a[1] * a[2]]);
    return y;
}

console.log(N22([1.1, 2.9]));
