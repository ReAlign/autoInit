/**
 * ----------------------------------------------
 * 首页入口
 * Created by hzqiushengqiang on 2016/5/23.
 * ----------------------------------------------
 */
NEJ.define([
    'base/klass',
    '{pro}widget/module.js'
],function(k, Module, p) {
    var pro;
    p._$$IndexModule = k._$klass();
    pro = p._$$IndexModule._$extend(Module._$$Module);

    pro.__init = function(_options) {
        this.__supInit(_options);
    };

    pro.__init = function(options){
        this.__super(options);
        // TODO something if necessary
    };

    p._$$IndexModule._$allocate();
});