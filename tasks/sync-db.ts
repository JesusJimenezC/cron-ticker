let times = 0;

const syncDB = () => {
  times++;
  console.log("Tick each five seconds", times);

  return times;
};

export { syncDB };
