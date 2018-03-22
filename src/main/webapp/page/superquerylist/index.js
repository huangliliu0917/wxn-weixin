var define, require;
if (function(t, e) {
    function n(t) {
        return function(e) {
            return {}.toString.call(e) == "[object " + t + "]"
        }
    }
    function i() {}
    var o = n("Function"),
    r = {};
    i.prototype.exec = function() {
        function t(t) {
            return i.get(t).exec()
        }
        var n = this;
        if (this.execed) return n.exports;
        this.execed = !0;
        var r = n.factory,
        a = o(r) ? r(t, n.exports = {},
        n) : r;
        return a === e && (a = n.exports),
        delete n.factory,
        n.exports = a,
        a
    },
    define = function(t, e, n) {
        o(e) && (n = e, e = []);
        var r = {
            id: t,
            deps: e,
            factory: n
        };
        i.save(r)
    },
    i.save = function(t) {
        var e = i.get(t.id);
        e.id = t.id,
        e.dependencies = t.deps,
        e.factory = t.factory
    },
    i.get = function(t) {
        return r[t] || (r[t] = new i)
    },
    t.require = function(t) {
        var e = i.get(t);
        return e.execed || e.exec(),
        e.exports
    }
} (this), define("", ["", "", "", "", ""]
),
function(t) {
    function e() {
        t.rem = n.getBoundingClientRect().width / 750 * 100,
        t.rem = t.rem>85.3333 ? 85.3333 : t.rem,
		n.style.fontSize = t.rem + "px",
        window.__REM_FONTSIZE__ = n.style.fontSize
    }
    var n = document.documentElement,
    i = null;
    t.addEventListener("resize",
    function() {
        clearTimeout(i),
        i = setTimeout(e, 300)
    }),
    t.addEventListener("pageshow",
    function(t) {
        t.persisted && (clearTimeout(i), i = setTimeout(e, 300))
    }),
    e()
} (window, void 0), window.seajs) seajs.config({});