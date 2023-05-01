const token = localStorage.getItem("token") !== null ? JSON.parse(localStorage.getItem("token")) : null;
const BASE_URL = "http://140.238.54.136/api";
const logisticApi = {
    async getAllProvinces() {
        const url = BASE_URL + "/province";
        let data;
        const response = await fetch(url, {
            headers: {
                'Authorization': `Bearer ${token}`
            }
        });
        data = await response.json();
        data = data?.original?.data;
        return data;
    }, async getDistrictByProvince(id) {
        const url = BASE_URL + `/district?provinceID=${id}`;
        let data;
        const response = await fetch(url, {
            headers: {
                'Authorization': `Bearer ${token}`
            }
        });
        data = await response.json();
        data = data?.original?.data;
        return data;
    }, async getWardByDistrict(id) {
        const url = BASE_URL + `/ward?districtID=${id}`;
        let data;
        const response = await fetch(url, {
            headers: {
                'Authorization': `Bearer ${token}`
            }
        });
        data = await response.json();
        data = data?.original?.data;
        return data;
    },
    getEstimateDelivery(data) {
        const url = "/leadTime";
    }, registerGoods(data) {
        const url = "/registerTransport";
    }, getAllGoodsRegistered() {
        const url = "/allTransports";
    }, getGoodsById(data) {
        const url = "/auth/getInfoTransport";
    }
}
export default logisticApi;