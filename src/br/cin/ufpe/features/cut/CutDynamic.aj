package br.cin.ufpe.features.cut;

import driver.util.AroundAdvice;
import driver.util.Driver;

public aspect CutDynamic extends CutFeature {

	pointcut driver() : if (Driver.isActivated("cut")); // true default
	
	void around() : adviceexecution() && within(br.cin.ufpe.features.cut.CutFeature)
		&& !@annotation(AroundAdvice){
		if (Driver.isActivated("cut")){
			proceed();
		}
	}
}