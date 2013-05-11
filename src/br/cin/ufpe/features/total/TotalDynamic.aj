package br.cin.ufpe.features.total;

import org.softlang.swing.view.AbstractView;

import driver.util.AroundAdvice;
import driver.util.Driver;

public aspect TotalDynamic extends TotalFeature {

	pointcut driver() : if (Driver.isActivated("total")); // true default
	
	pointcut newAbstractView(AbstractView cthis) : TotalFeature.newAbstractView(cthis) && driver();
	
	void around() : adviceexecution() && within(br.cin.ufpe.features.total.TotalFeature)
		&& !@annotation(AroundAdvice) {
		if (Driver.isActivated("total")){
			proceed();
		}
	}
}