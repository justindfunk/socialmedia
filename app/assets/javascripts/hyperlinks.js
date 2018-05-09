function scrapeUrl(e) {
    var url = e.target.value;
    $.get(root_url + '/hyperlinks/scrape.js?url=' + url +'&id=' + e.target.id);
}