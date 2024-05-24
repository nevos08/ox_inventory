import React, { useMemo } from 'react';
import { FaWeightHanging } from 'react-icons/fa6';

const colorChannelMixer = (colorChannelA: number, colorChannelB: number, amountToMix: number) => {
  let channelA = colorChannelA * amountToMix;
  let channelB = colorChannelB * (1 - amountToMix);
  return channelA + channelB;
};

const colorMixer = (rgbA: number[], rgbB: number[], amountToMix: number) => {
  let r = colorChannelMixer(rgbA[0], rgbB[0], amountToMix);
  let g = colorChannelMixer(rgbA[1], rgbB[1], amountToMix);
  let b = colorChannelMixer(rgbA[2], rgbB[2], amountToMix);
  return `rgb(${r}, ${g}, ${b})`;
};

const COLORS = {
  // Colors used - https://materialui.co/flatuicolors
  primaryColor: [231, 76, 60], // Red (Pomegranate)
  secondColor: [39, 174, 96], // Green (Nephritis)
  accentColor: [211, 84, 0], // Orange (Oragne)
};

const WeightBar: React.FC<{ percent: number; durability?: boolean }> = ({ percent, durability }) => {
  const color = useMemo(
    () =>
      durability
        ? percent < 50
          ? colorMixer(COLORS.accentColor, COLORS.primaryColor, percent / 100)
          : colorMixer(COLORS.secondColor, COLORS.accentColor, percent / 100)
        : percent > 50
        ? colorMixer(COLORS.primaryColor, COLORS.accentColor, percent / 100)
        : colorMixer(COLORS.accentColor, COLORS.secondColor, percent / 50),
    [durability, percent]
  );

  return (
    <div className={!durability ? 'weight-bar-wrapper' : undefined}>
      {!durability && <FaWeightHanging className="weight-bar-icon" />}
      <div className={durability ? 'durability-bar' : 'weight-bar'}>
        <div
          style={{
            visibility: percent > 0 ? 'visible' : 'hidden',
            height: '300%',
            borderRadius: '100px',
            translate: '0 -30%',
            width: `${percent}%`,
            backgroundColor: durability ? color : 'rgb(30, 141, 174)',
            transition: `background ${0.3}s ease, width ${0.3}s ease`,
          }}
        ></div>
      </div>
    </div>
  );
};
export default WeightBar;
