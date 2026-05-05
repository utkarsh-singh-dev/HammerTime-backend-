package com.biddingsystem.dto;

import java.util.ArrayList;
import java.util.List;

import com.biddingsystem.entity.ProductOffer;

import lombok.Data;

@Data
public class ProductOfferResponse extends CommonApiResponse {
	
	List<ProductOffer> offers = new ArrayList<>();

	public List<ProductOffer> getOffers() {
		return offers;
	}

	public void setOffers(List<ProductOffer> offers) {
		this.offers = offers;
	}

}
