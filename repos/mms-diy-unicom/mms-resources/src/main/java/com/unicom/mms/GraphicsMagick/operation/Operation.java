package com.unicom.mms.GraphicsMagick.operation;

import java.util.LinkedList;

public class Operation {
	/**
	 * The list of command-line arguments.
	 */

	LinkedList<String> iCmdArgs = null;

	public Operation() {
		iCmdArgs = new LinkedList<String>();
	}

	/**
	 * Convert to String. Note that the arguments are not quoted!
	 */

	public String toString() {
		StringBuffer buf = new StringBuffer();
		for (String arg : iCmdArgs) {
			buf.append(arg).append(" ");
		}
		return buf.toString();
	}

	/**
	 * Return the raw arguments.
	 */

	public LinkedList<String> getCmdArgs() {
		return iCmdArgs;
	}

	/**
	 * Add image(s) to the operation.
	 */

	public Operation addImage(String... pImages) {
		for (String img : pImages) {
			if (img != null && !"".equals(img.trim())) {
				iCmdArgs.add(img.trim());
			}
		}
		return this;
	}
}
