import logisticApi from "./logisticApi.js";

(async () => {
    const listProvinces = await logisticApi.getAllProvinces();
    let listDistricts;
    let listWards;
    let flagCity = false;
    let flagDistrict = false;
    let flagWard = false;
    const selectInputCity = document.querySelector("select[name='city']");
    const selectInputDistrict = document.querySelector("select[name='district']");
    const selectInputWard = document.querySelector("select[name='address']");
    const inputWardId = document.querySelector("input[name='toWardID']");
    const inputDistrictId = document.querySelector("input[name='toDistrictID']");
    // load
    await (async () => {

        const idCity = listProvinces?.find((province) => province.ProvinceName === selectInputCity?.options[selectInputCity?.selectedIndex]?.value?.trim())?.ProvinceID;
        if (idCity) {
            listDistricts = await logisticApi.getDistrictByProvince(idCity);
            let optionELDistrict;
            listDistricts?.map((district) => {
                optionELDistrict = document.createElement('option');
                optionELDistrict.setAttribute("value", district.DistrictName);
                optionELDistrict.setAttribute("name", "city");
                optionELDistrict.textContent = district.DistrictName;
                optionELDistrict.setAttribute("data-id", district.DistrictID);
                selectInputDistrict.appendChild(optionELDistrict);
            });
        }
        const idDistrict = listDistricts?.find((district) => district.DistrictName === selectInputDistrict?.value?.trim())?.DistrictID;
        if (idDistrict) {
            listWards = await logisticApi.getWardByDistrict(idDistrict);
            let optionELWard;
            listWards?.map((ward) => {
                optionELWard = document.createElement('option');
                optionELWard.setAttribute("value", ward.WardName);
                optionELWard.setAttribute("name", "city");
                optionELWard.textContent = ward.WardName;
                optionELWard.setAttribute("data-id", ward.WardCode);
                selectInputWard.appendChild(optionELWard);
            });
        }
        if (inputWardId && inputDistrictId) {
            const idWard = listWards?.find((ward) => ward.WardName.trim() === selectInputWard?.value?.trim())?.WardCode;

            inputWardId.setAttribute("value", idWard);
            inputDistrictId.setAttribute("value", idDistrict);
        }
    })()

    //event
    if (selectInputCity && listProvinces) {
        let optionELCity;
        if (!flagCity) {
            selectInputCity.addEventListener("change", async function (event) {
                listDistricts = await logisticApi.getDistrictByProvince(Number.parseInt(event.target?.options[event.target?.selectedIndex]?.dataset?.id));
                selectInputDistrict.innerHTML = '';
                let optionELDistrict;
                listDistricts?.map((district) => {
                    optionELDistrict = document.createElement('option');
                    optionELDistrict.setAttribute("value", district.DistrictName);
                    optionELDistrict.setAttribute("name", "city");
                    optionELDistrict.textContent = district.DistrictName;
                    optionELDistrict.setAttribute("data-id", district.DistrictID);
                    selectInputDistrict.appendChild(optionELDistrict);
                });
                listWards = await logisticApi.getWardByDistrict(listDistricts[0]?.DistrictID);
                selectInputWard.innerHTML = '';
                let optionELWard;
                listWards?.map((ward) => {
                    optionELWard = document.createElement('option');
                    optionELWard.setAttribute("value", ward.WardName);
                    optionELWard.setAttribute("name", "city");
                    optionELWard.textContent = ward.WardName;
                    optionELWard.setAttribute("data-id", ward.WardCode);
                    selectInputWard.appendChild(optionELWard);
                });
                if (inputWardId && inputDistrictId) {
                    const idDistrict = listDistricts?.find((district) => district.DistrictName === selectInputDistrict?.value?.trim())?.DistrictID;
                    const idWard = listWards?.find((ward) => ward.WardName.trim() === selectInputWard?.value?.trim())?.WardCode;
                    inputWardId.setAttribute("value", idWard);
                    inputDistrictId.setAttribute("value", idDistrict);
                }
            });
            flagCity = true;

        }
        if (!flagDistrict) {
            selectInputDistrict.addEventListener("change", async function (event) {
                listWards = await logisticApi.getWardByDistrict(Number.parseInt(event.target.options[event.target?.selectedIndex]?.dataset?.id));
                selectInputWard.innerHTML = '';
                let optionELWard;
                listWards?.map((ward) => {
                    optionELWard = document.createElement('option');
                    optionELWard.setAttribute("value", ward.WardName);
                    optionELWard.setAttribute("name", "city");
                    optionELWard.textContent = ward.WardName;
                    optionELWard.setAttribute("data-id", ward.WardCode);
                    selectInputWard.appendChild(optionELWard);
                });
                if (inputWardId && inputDistrictId) {
                    inputDistrictId.setAttribute("value", event.target.options[event.target.selectedIndex]?.dataset?.id);
                    const idWard = listWards?.find((ward) => ward.WardName.trim() === selectInputWard?.value?.trim())?.WardCode;
                    inputWardId.setAttribute("value", idWard);
                }
            })
            flagDistrict = true;
        }
        listProvinces?.map((province) => {
            optionELCity = document.createElement('option');
            optionELCity.setAttribute("value", province.ProvinceName);
            optionELCity.setAttribute("name", "city");
            optionELCity.textContent = province.ProvinceName;
            optionELCity.setAttribute("data-id", province.ProvinceID);
            selectInputCity.appendChild(optionELCity);
        })
        if (!flagWard) {
            flagWard = true;
            selectInputWard.addEventListener("change", async function (event) {
                if (inputWardId && inputDistrictId) {
                    inputWardId.setAttribute("value", event.target.options[event.target.selectedIndex]?.dataset?.id);
                }
            })

        }
    }

})()

