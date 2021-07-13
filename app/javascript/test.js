function test() {
  const CLASSNAME = "-visible";
  const TIMEOUT = 2000;
  const $target = $(".title");

  setInterval(() => {
    $target.addClass(CLASSNAME);
    setTimeout(() => {
      $target.removeClass(CLASSNAME);
    }, TIMEOUT);
  }, TIMEOUT * 2);


}
window.addEventListener('load', test);