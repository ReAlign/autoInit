/**
 * ----------------------------------------------
 * 首页详情
 * Created by hzqiushengqiang on 2016/8/31.
 * ----------------------------------------------
 */
NEJ.define([
    'base/util',
    "pro/extend/util",
    'text!./detail.html',
    'pro/components/list/refundWarehouse/commonList',
    'pro/components/notify/notify',
    'pro/components/datepicker/startAndEnd'
], function (_ut, _, _html, ListComponent, notify, _p, _o, _f, _r) {
    return ListComponent.extend({
        template: _html,
        url: '/home/packageInfo.do',
        name: "homepage-detail",
        config: function (data) {
            _.extend(data, {
                list: [],
                info: {},
                filter: {}
            });
            this.initFilterData(data);
        },
        initFilterData: function (data) {
            var endDate = new Date(), startDate = new Date();
            startDate.setDate(startDate.getDate() - 7);
            data.filter.startTime = _ut._$format(startDate, 'yyyy-MM-dd');
            data.filter.endTime = _ut._$format(endDate, 'yyyy-MM-dd');
        },
        changeReturnBin: function () {
            var data = this.data;
            data.filter.refundWarehouseId && this.getList();
        },
        selectDate: function (_data) {
            var data = this.data;
            data.filter.startTime = _data.startDate;
            data.filter.endTime = _data.endDate;
            data.filter.refundWarehouseId && this.getList();
        },
        afterGetList: function (json) {
            var data = this.data;
            data.info = json.packageInfo || {}
        },
        redirectPage: function (type) {
            var filter = this.data.filter, refundWarehouseId = filter.refundWarehouseId, startTime = filter.startTime, endTime = filter.endTime, urls = {
                1: "/flow/unmatchedPackage.do?from=homepage&isMatch=1&returnBin=" + refundWarehouseId,
                2: "/register/registerPackage.do?from=homepage&returnBin=" + refundWarehouseId,
                3: "/flow/matchedPackage.do?from=homepage&startTime=" + startTime + "&endTime=" + endTime + "&returnBin=" + refundWarehouseId,
                4: "/flow/unmatchedPackage.do?from=homepage&returnBin=" + refundWarehouseId,
                5: "/register/registerPackage.do?from=homepage&startTime=" + startTime + "&endTime=" + endTime + "&returnBin=" + refundWarehouseId
            };
            if (!filter.refundWarehouseId) {
                notify.showWarning('请选择退货仓');
                return false;
            }
            window.open(urls[type]);
        }
    });
});