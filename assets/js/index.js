document.addEventListener('afl_complete', (e) => {
    const form = e.detail.form;
    if(e.detail.response.success && e.detail.response.data.btn_text){
        form.querySelector('.afl-compare-btn').textContent = e.detail.response.data.btn_text;
    }
});
