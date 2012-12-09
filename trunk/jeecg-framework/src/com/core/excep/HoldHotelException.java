package com.core.excep;

/**
 *
 * @功能 自定义异常 HoldHotelException
 * @author 创建人 gao_jie
 * @date 创建日期 Jul 3, 2008
 * @version 1.0
 *
 */
public class HoldHotelException extends Exception {
	private static final long serialVersionUID = 1L;

	/**
	 * Constructs a new exception with <code>null</code> as its detail
	 * message. The cause is not initialized, and may subsequently be
	 * initialized by a call to {@link #initCause}.
	 */
	public HoldHotelException() {
		super();
	}

	/**
	 * @param message
	 *            the detail message. The detail message is saved for later
	 *            retrieval by the {@link #getMessage()} method.
	 */
	public HoldHotelException(String message) {
		super(message);
	}

	/**
	 * @param message
	 *            the detail message (which is saved for later retrieval by the
	 *            {@link #getMessage()} method).
	 * @param cause
	 *            the cause (which is saved for later retrieval by the
	 *            {@link #getCause()} method). (A <tt>null</tt> value is
	 *            permitted, and indicates that the cause is nonexistent or
	 *            unknown.)
	 * @since 1.4
	 */
	public HoldHotelException(String message, Throwable cause) {
		super(message, cause);
	}

	/**
	 * @param cause
	 *            the cause (which is saved for later retrieval by the
	 *            {@link #getCause()} method). (A <tt>null</tt> value is
	 *            permitted, and indicates that the cause is nonexistent or
	 *            unknown.)
	 * @since 1.4
	 */
	public HoldHotelException(Throwable cause) {
		super(cause);
	}
}
