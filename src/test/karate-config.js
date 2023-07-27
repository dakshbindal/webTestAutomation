function fn(){
    karate.configure('driver', { type: 'chromedriver', headless: false , addOptions: ["--remote-allow-origins=*"]});

}
